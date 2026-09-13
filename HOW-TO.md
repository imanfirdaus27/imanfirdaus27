# How this works

GitHub has one special rule: **a repository named exactly the same as your username** shows its
`README.md` at the top of your profile page.

Your username is `imanfirdaus27`, so the repo must be named `imanfirdaus27`.

## Steps

1. Go to **https://github.com/new**
2. Repository name: **`imanfirdaus27`** — GitHub will show a note saying
   *"You found a secret! imanfirdaus27/imanfirdaus27 is a special repository..."*
   That note is how you know you typed it right.
3. Set it **Public**. (A private one will not display.)
4. Create it.
5. In PowerShell:

```powershell
cd "C:\Users\firda\Desktop\Master\github-profile"
.\push_profile.ps1
```

6. Open **https://github.com/imanfirdaus27** — the profile README is now at the top.

## Editing it later

Change `README.md` in this folder and run `.\push_profile.ps1` again. Nothing else to do.

## What was deliberately left out

- **Your phone number.** It is on your CV, which you send to people you choose. A public GitHub
  profile is scraped constantly; a phone number there gets you spam calls, not interviews. The
  LinkedIn and email links are enough for a recruiter to reach you.
- **Salary expectation and notice period.** Those belong in a conversation, not on a public page —
  publishing a number sets a ceiling before anyone has made you an offer.
- **Anything not in your resume bank.** No cloud platforms, no Docker, no Kafka, nothing you have
  not actually used. Every badge on the profile is something you can be asked about.
