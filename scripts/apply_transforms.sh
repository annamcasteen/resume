#!sh
set -x
DESCRIPTION="${DESCRIPTION?Please provide a description.}"
KEYWORDS="${KEYWORDS?Please provide some keywords for your site.}"
RESUME_TITLE="${RESUME_TITLE?Please provide a resume title.}"
GOOGLE_ANALYTICS_TAG="${GOOGLE_ANALYTICS_TAG?Please provide a Google Analytics tag.}"
TF_VAR_aws_route53_zone="${TF_VAR_aws_route53_zone?Please define a zone to host the website in.}"
GITHUB_URL="${GITHUB_URL:-$(git ls-remote --get-url origin)}"

apply_template() {
  resume_url="https://resume.${TF_VAR_aws_route53_zone}"
  sed -i "s/\[DESCRIPTION\]/$DESCRIPTION/g" output/resume.html
  sed -i "s/\[KEYWORDS\]/$KEYWORDS/g" output/resume.html
  sed -i "s/\[RESUME_TITLE\]/$RESUME_TITLE/g" output/resume.html
  sed -i "s/\[GA_TAG\]/$GOOGLE_ANALYTICS_TAG/g" output/resume.html
  sed -i "s#\[RESUME_URL\]#$resume_url#g" output/resume.html
}

copy_favicon() {
  cp include/favicon.ico output/
}

apply_ogp_prefix_to_support_link_cards() {
  sed -i 's/^<head>/<head prefix=\"og: http:\/\/ogp.me\/ns#\">/' output/resume.html
}

add_logo() {
  cp ./logo.png ./output/logo.png
}

verify_github_url_or_die() {
  if ! $(echo "$GITHUB_URL" |  egrep -q '^(http|https)://github.com')
  then
    >&2 echo "ERROR: GitHub URL not valid: $GITHUB_URL"
    >&2 echo "SOLUTION: Add or change GitHub URL in docker-compose.yml, then try again."
    exit 1
  fi
}

verify_github_url_or_die && \
  apply_template && \
  apply_ogp_prefix_to_support_link_cards && \
  add_logo &&
  copy_favicon
