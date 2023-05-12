-- Netapp-specific configuration to make neovim get plugins and other assets from repomirror.
-- $HOME/.config/netapp/lua/config/plugins_netapp.lua

-- Configure Lazy to find plugins on repomirror
-- Documentation: https://github.com/folke/lazy.nvim#%EF%B8%8F-configuration
local opts = {
  change_detection = {
    notify = false, -- don't notify me when the neovim config files are changed
  },
  -- use repomirror instead of github for plugins
  git = {
    url_format = 'https://repomirror-rtp.eng.netapp.com/github-neovim/%s.git'
  }
}
require('lazy').setup('plugins', opts)

-- Configure Mason to use a Netapp mirror to find assets.
-- This is for langage support including language servers and linters.
-- Configuration documentation: https://github.com/williamboman/mason.nvim
require('mason').setup({
  github = {
    -- The template URL to use when downloading assets from GitHub.
    -- The placeholders are the following (in order):
    -- 1. The repository (e.g. 'rust-lang/rust-analyzer')
    -- 2. The release version (e.g. 'v0.3.0')
    -- 3. The asset name (e.g. 'rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz')
    --
    -- Netapp provides access to github releases like this:
    -- https://confluence.ngage.netapp.com/display/NGAGE/Repository+Services+-+Internet+and+Internal+Repository+Proxies#RepositoryServicesInternetandInternalRepositoryProxies-GitHubProjectReleaseDownloads
    download_url_template = 'https://proxy.repo.eng.netapp.com/generic-github-releases/%s/releases/download/%s/%s',
  }
})

--   *** nvim binary
--   Download the latest neovim binary onto your linux system like this:
--     sudo curl -L https://proxy.repo.eng.netapp.com/generic-github-releases/neovim/neovim/releases/download/nightly/nvim.appimage --output /usr/local/bin/nvim
--     sudo chmod +x /usr/local/bin/nvim
--
--   *** submodules
--   Some plugins (aerial, LuaSnip) have submodules which are dependencies declared inside the package code.
--   Lazy downloads the main package code, which then specifies the submodules that it wants and provdes github urls for them.
--   Lazy attempts to download those github urls. The git.url_format configuration is not used for this, so the download fails.
--   Solution: for these modules I have disabled submodules (plugin configuration sets submodules = false.)
--   Unclear if it then becomes necessary to specify these as dependencies, needs experimentation 
