local distant_status_ok, distant = pcall(require, "distant")
if not distant_status_ok then
  return
end

local settings_status_ok, settings = pcall(require, "distant.settings")
if not settings_status_ok then
  return
end


local actions = require('distant.nav.actions')

distant.setup {
  -- Applies Chip's personal settings to every machine you connect to
  --
  -- 1. Ensures that distant servers terminate with no connections
  -- 2. Provides navigation bindings for remote directories
  -- 3. Provides keybinding to jump into a remote file's parent directory

  ['*'] = {
    distant = {
      args = { '--shutdown', 'lonely=60' },
      bin = '~/bin/distant/distant',
    },
    file = {
      mappings = {
        ['-'] = actions.up,
      },
    },
    dir = {
      mappings = {
        ['<Return>'] = actions.edit,
        ['-']        = actions.up,
        ['K']        = actions.mkdir,
        ['N']        = actions.newfile,
        ['R']        = actions.rename,
        ['D']        = actions.remove,
      }
    },
    ssh = {
      user = 'm310131'
    }
  },
  -- OLD PROD
  ['deda1x2699'] = {
    ssh = {
      proxy_command = "ssh nxuser -W %h:%p"
    }
  },
  -- M2 VAL
  ['deda1x3128'] = {
    ssh = {
      proxy_command = "ssh nxuser -W %h:%p"
    }
  },
  -- M2 PROD
  ['deda1x3766'] = {
    ssh = {
      proxy_command = "ssh nxuser -W %h:%p"
    }
  },
  ['deda1x3388'] = {
    ssh = {
      proxy_command = "ssh nxuser -W %h:%p"
    }
  },
  -- HPC PROD
  ['deda1x3155'] = {
    ssh = {
      proxy_command = "ssh nxuser -W %h:%p"
    }
  },
  -- HPC Test
  ['deda1x3035'] = {
    ssh = {
      proxy_command = "ssh nxuser -W %h:%p"
    }
  },
  -- M22 Test
  ['deda1x3390'] = {
    ssh = {
      proxy_command = "ssh nxuser -W %h:%p"
    }
  },
  -- R421 Test
  ['deda1x4746'] = {
    ssh = {
      proxy_command = "ssh nxuser -W %h:%p"
    }
  },
  ['deda1x4783'] = {
    ssh = {
      proxy_command = "ssh nxuser -W %h:%p"
    }
  },
  -- R421 VAL
  ['deda1x4747'] = {
    ssh = {
      proxy_command = "ssh nxuser -W %h:%p"
    }
  },
}
