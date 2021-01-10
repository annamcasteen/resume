Resume!
========

This is your resume. There are many like it, but this one is yours.

How do I update it?
-------------------

### Prerequisites

- You'll need to install Docker on your computer first.
  [Here's how you can install that.](https://docs.docker.com/docker-for-mac/)

- You'll also need to have Git installed to clone and update this repository.
  If you have a Mac, you already have it! [Follow these
  instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  to install Git on Windows.

- You'll also need a code editor to make changes to your resume.
  I recommend Visual Studio Code. Click [here](https://code.visualstudio.com/download)
  to download and install it.

- You'll also need an `env.gpg`, a file in your repository that contains settings for the stuff in
  [Amazon Web Services](https://aws.com) that will host your resume.

  [Email me](mailto:dev@carlosnunez.me) to get a new one.

### Okay! I've got everything. Let's go!

1. Create a new secret in your GitHub repository called `env_file_encryption_key`.
   [Click
   here](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets)
   to learn how to create new secrets for your GitHub repository.

   Paste the environment password that you received into the value for the
   `env_file_encryption_key` secret.

2. Open Terminal (Command + Space, type "Terminal"). Use `git` to clone this
   repository: `git clone <url_in_address_bar>`. Git  will create a new folder
   called `resume` from wherever you ran this command.

2. Decrypt env.gpg: `ENV_PASSWORD="Your Password" docker-compose -f docker-compose.ci.yml run --rm decrypt-env`

### **Steps 1, 2, and 2 have already been done.  Start with step 2 below:**

2. Open `resume.md` in Visual Studio Code (or your favorite editor).
   It's written in Markdown. You can learn how more about this language
   [here](https://daringfireball.net/projects/markdown/syntax).

3. Update your resume. Open Terminal (Command + Space, type "Terminal"), then
   run this command: `docker-compose run --rm resume-make`.

4. Use Terminal to open resume.html  `open output/resume.html`  This opens in Safari (default browser).  
 
   If you want to see what PDFs will look like, use Terminal and put `open output/resume.pdf`

5. If you like what you see, commit your changes by copying into Terminal:
   `git add resume.md && git commit -m "I did a thing." resume.md`
   (Change "I did a thing" to the thing that you actually did.)

6. Push your changes to GitHub in Terminal: `git push`

7. Within a few minutes, your resume should appear at `https://resume.<your-website>`  You can check
   the progess on github.com by signing into your account and clicking on the annacasteen resume repository.
