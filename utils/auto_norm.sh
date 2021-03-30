#!/bin/sh
# automatic norm for arguments directory
function auto_norm()
{
    echo "current setting:"
    ls ../$1
    norminette -R CheckForbiddenSourceHeader ../$1
}

