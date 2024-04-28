# How to write a report
## Git and Terminal

You need to know how to use Git and a terminal to work on the project. The related tutorials are in the book [Scientific Computing for Physicists](https://book.jinguo-group.science). The following are the links to the tutorials:
- [How to get a terminal](https://book.jinguo-group.science/stable/chap1/terminal/)
- [How to use Git](https://book.jinguo-group.science/stable/chap1/git/)

## GitHub Copilot + Markdown for technical writing

This is a workflow for setting up AI-assisted technical writing using Github Copilot and Markdown.

#### Step 1: Setup Markdown Editor
1. Go to [VS Code website](https://code.visualstudio.com/) and download the latest version, then install & open VS Code.
3. Add the following VS Code extensions. To add an VS Code extension, please click the `Extensions` button in the left side bar, search for the extension name and click the `Install` button.
    - [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)
    - [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
    - [Paste Image](https://marketplace.visualstudio.com/items?itemName=mushan.vscode-paste-image)
    - [vscode-reveal](https://marketplace.visualstudio.com/items?itemName=evilz.vscode-reveal) - for presentation
4. Create a new file and save it as `test.md`. Then, click the `Preview` button ![](images/preview.png){width=20px} in the top right corner.
5. Edit the markdown file. You can learn markdown from [here](https://www.markdownguide.org/basic-syntax/). Math equations can also be rendered. For example, the following code
    ~~~
    $$
    \frac{1}{2}
    $$
    ~~~
    will be rendered as
    ```math
    \frac{1}{2}
    ```

#### Step 2: Setup GitHub Copilot
1. Go to the [GitHub website](https://github.com/) and sign up for a free account.
2. Install the [GitHub Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot) extension. GitHub Copilot requires you to connect with your Github account. You can also use it for free if you are a student ([check out](https://education.github.com/pack)) or you will be charged for using it. Learn more from this [YouTube video](https://youtu.be/HDG4PQK7DK8?si=sOR7PqNcGAnrV4Tm).
3.  You might need to activate the GitHub Copilot extension by clicking the `Activate` (![](images/copilot.png){width=20px}) button in the bottom right corner of the VS Code window to make it work. Then you can type some text in the editor and press `Tab` to confirm the suggestion from Github Copilot.
#### Step 3: Using GitHub/GitLab to host your markdown (optional)
GitHub/GitLab is a code hosting platform for version control and collaboration. It allows you to
- sync files across different devices,
- work together with others from anywhere, and
- preview markdown files in the browser.

You can learn GitHub from the [YouTube video](https://www.youtube.com/watch?v=RGOj5yH7evk) or the [official guide](https://guides.github.com/activities/hello-world/). The GitLab workflow that we will use is similar.