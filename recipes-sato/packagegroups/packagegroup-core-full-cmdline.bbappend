# mc has a dependency on perl which we can't satisfy, so remove it
RDEPENDS:packagegroup-core-full-cmdline-utils:remove = "mc"
RDEPENDS:packagegroup-core-full-cmdline-utils:remove = "mc-fish"
RDEPENDS:packagegroup-core-full-cmdline-utils:remove = "mc-helpers"
RDEPENDS:packagegroup-core-full-cmdline-utils:remove = "mc-helpers-perl"
