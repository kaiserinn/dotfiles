{unstable, ...}: {
  programs.jujutsu = {
    enable = true;
    package = unstable.jujutsu;
    settings = {
      user = {
        name = "Azhar Rizqullah";
        email = "azharizqullah90@gmail.com";
      };
    };
  };
}
