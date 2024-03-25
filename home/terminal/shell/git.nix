{...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "thomas.croft@proton.me";
    userName = "Thomas Croft";
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
