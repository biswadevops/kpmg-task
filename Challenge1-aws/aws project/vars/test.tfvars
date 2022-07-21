
# ~~~~~~~~~~~~~~~#
#  demo project
# ~~~~~~~~~~~~~~~#

ec2_configuration = {
  "demo-DB1-1" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "r5a.xlarge"
    "preferred_az"          = "eu-west-2a"
    "secondary_private_ips" = ["172.21.16.139"]
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "40"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbf"
        "volume_size" = "15"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbg"
        "volume_size" = "64"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbh"
        "volume_size" = "90"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbi"
        "volume_size" = "15"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbj"
        "volume_size" = "223"
        "volume_type" = "gp2"
      }
    ]
  }

  "demo-DB1-2" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "r5a.large"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = ["172.21.23.104"]
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "40"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbf"
        "volume_size" = "15"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbg"
        "volume_size" = "64"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbh"
        "volume_size" = "90"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbi"
        "volume_size" = "15"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbj"
        "volume_size" = "223"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-DB2-1" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "t2.xlarge"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = []
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "30"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbf"
        "volume_size" = "30"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbg"
        "volume_size" = "300"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbh"
        "volume_size" = "200"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbi"
        "volume_size" = "30"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbj"
        "volume_size" = "710"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-DB2-2" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "t2.xlarge"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = []
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "30"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbf"
        "volume_size" = "30"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbg"
        "volume_size" = "300"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbh"
        "volume_size" = "200"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbi"
        "volume_size" = "30"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbj"
        "volume_size" = "710"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-DB3-1" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "t3a.medium"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = []
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "20"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbf"
        "volume_size" = "30"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbg"
        "volume_size" = "20"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-DB3-2" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "t3a.medium"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = []
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "20"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbf"
        "volume_size" = "30"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbg"
        "volume_size" = "20"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-DB4-1" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "t3a.large"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = []
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "20"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbf"
        "volume_size" = "35"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbg"
        "volume_size" = "165"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbh"
        "volume_size" = "160"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbi"
        "volume_size" = "580"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbj"
        "volume_size" = "1090"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-DB4-2" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "t3a.large"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = []
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "20"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbf"
        "volume_size" = "35"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbg"
        "volume_size" = "165"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbh"
        "volume_size" = "160"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbi"
        "volume_size" = "250"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbj"
        "volume_size" = "500"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-WISEAPP" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "t3a.medium"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = ["172.21.20.159"]
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "30"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-IMSS1" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "t2.xlarge"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = ["172.21.21.200"]
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "40"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbr"
        "volume_size" = "435"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbs"
        "volume_size" = "500"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbt"
        "volume_size" = "100"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-IMSS2" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "t2.xlarge"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = ["172.21.20.181"]
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "40"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbs"
        "volume_size" = "500"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbt"
        "volume_size" = "100"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-SHS1" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "m5a.2xlarge"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = ["172.21.22.98"]
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "20"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-SHS2" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "m5a.2xlarge"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = ["172.21.20.96"]
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "20"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-ATNA" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "t3a.large"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = []
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "50"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbe"
        "volume_size" = "100"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-EWE1" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "m5a.2xlarge"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = []
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "20"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbe"
        "volume_size" = "180"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-EWE2" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "m5a.2xlarge"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = []
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "20"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbe"
        "volume_size" = "180"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-EWE3" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "m5a.2xlarge"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = ["172.21.20.76"]
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "20"
        "volume_type" = "gp2"
      },
      {
        "device_name" = "/dev/xvdbe"
        "volume_size" = "180"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-SMS" = {
    "ami"                   = "ami-008f31f1f121ef11e"
    "instance_type"         = "t3a.medium"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = ["172.21.22.90"]
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "20"
        "volume_type" = "gp2"
      }
    ]
  }
  "demo-FGW1" = {
    "ami"                   = "ami-019ee48089ccac868"
    "instance_type"         = "m4.xlarge"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = ["172.21.23.140"]
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "500"
        "volume_type" = "st1"
      }
    ]
  }
  "demo-FGW2" = {
    "ami"                   = "ami-019ee48089ccac868"
    "instance_type"         = "m5a.2xlarge"
    "preferred_az"          = "eu-west-2b"
    "secondary_private_ips" = ["172.21.22.25"]
    "root_block" = {
      "volume_size" = "80"
      "volume_type" = "gp2"
    }
    "ebs_block" = [
      {
        "device_name" = "/dev/xvdbd"
        "volume_size" = "500"
        "volume_type" = "st1"
      }
    ]
  }

}

username                  = "admin"
domain_name               = "workspaces.mytask.local"
file_gateway_vpc_endpoint = "vpce-0917e7bb2e45defac-ll36j5xt.storagegateway.eu-west-2.vpce.amazonaws.com"
