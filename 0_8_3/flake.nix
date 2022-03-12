{
  description = ''A command-line YouTube player and more'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nimcoon-0_8_3.flake = false;
  inputs.src-nimcoon-0_8_3.owner = "gitweb";
  inputs.src-nimcoon-0_8_3.ref   = "refs/tags/0.8.3";
  inputs.src-nimcoon-0_8_3.repo  = "nimcoon";
  inputs.src-nimcoon-0_8_3.type  = "other";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nimcoon-0_8_3"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nimcoon-0_8_3";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}