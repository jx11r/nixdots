{}:

{
  enable = true;

  config = {
    init.defaultBranch = "main";
    pull.rebase = true;
    commit.gpgsign = true;
    tag.gpgsign = true;

    user = {
      email = "jx11r@hotmail.com";
      name = "jx11r";
      signingkey = "F426C30C08590756";
    };
  };
}
