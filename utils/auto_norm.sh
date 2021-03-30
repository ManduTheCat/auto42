#!/bin/sh
# automatic norm for arguments directory
function auto_norm()
{
    norminette -R CheckForbiddenSourceHeader ../$1
}
