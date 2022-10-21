## copied from Frank's gapsync and modified for our needs

Assert( 0, LoadPackage( "ToolsForHomalg", false ) );

DIR := ExecForHomalg( "echo ${DIR}" );;
NormalizeWhitespace( DIR );

xx := ExecForHomalg( "echo ${homalg_project_modules}" );;
NormalizeWhitespace( xx );;
xx := SplitString( xx, " " );

Display( xx );

for nam in xx do
    LoadPackage( nam );
od;
Unbind(nam);

xx := ExecForHomalg( "echo ${extra_modules}" );;
NormalizeWhitespace( xx );;
xx := SplitString( xx, " " );

Display( xx );

# load here all packages you want to include in the standard workspace
for nam in xx do
    LoadPackage( nam );
od;
Unbind(nam);

# load help book infos with a dummy help query
??blablfdfhskhks

# a small trick to make everything sensible available to the TAB completion
function() local a; for a in NamesGVars() do if ISB_GVAR(a) then VAL_GVAR(a); fi;od;end();

SaveWorkspace( Concatenation( DIR, "/checksums/homalg_workspace_git" ) );

QUIT;
