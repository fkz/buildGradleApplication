{ gradle, runCommand }:
{ src }:

runCommand "repositories.nix" {
    nativeBuildInputs = [ gradle ];
    inherit src;
} ''
    cd $src && gradle -q -I ${./listRepositories.gradle} listRepositories > $out
''
