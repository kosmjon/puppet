class baseline {  
    Service {
        hasstatus => true,
        hasrestart => true
    }

    File {
        owner => "root",
        group => "root",
        mode  => 644,
    }

    include yum
    include wget
}