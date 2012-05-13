class basefiles {
    file { "/etc/shellcolors":
        owner  => "root",
        group  => "root",
        mode   => '0644',
        source => "puppet:///basefiles/etc/shellcolors"
    }
    file { "/etc/bash.bashrc":
        owner  => "root",
        group  => "root",
        mode   => '0644',
        source => "puppet:///basefiles/etc/bash.bashrc"
    }
    file { "/etc/profile":
        owner  => "root",
        group  => "root",
        mode   => '0644',
        source => "puppet:///basefiles/etc/profile"
    }

    file { "/etc/skel":
        ensure  => directory,
        recurse => true,
        purge   => true,
        force   => true,
        owner   => "root",
        group   => "root",
        mode    => '0644',
        source  => "puppet:///basefiles/etc/skel",
    }

    file { "/root/.shellcolors":
        owner  => "root",
        group  => "root",
        mode   => '0644',
        source => "puppet:///basefiles/root/.shellcolors"
    }
    file { "/root/.bashrc":
        owner  => "root",
        group  => "root",
        mode   => '0644',
        source => "puppet:///basefiles/etc/skel/.bashrc"
    }
    file { "/root/.profile":
        owner  => "root",
        group  => "root",
        mode   => '0644',
        source => "puppet:///basefiles/etc/skel/.profile"
    }
}
