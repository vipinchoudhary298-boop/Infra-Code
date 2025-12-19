rgs = {
  rg1 = {
    name       = "dev-rg1"
    location   = "eastus"
    managed_by = "terraform"
    tags = {
      owner = "nokia"

    }
  }
}

networks = {
  vnet1 = {
    name          = "dev-vnet"
    location      = "eastus"
    rg_name       = "dev-rg1"
    address_space = ["10.0.0.0/16"]
    tags = {
      environment = "dev-production"
    }

    subnets = {
      s1 = {
        name             = "dev-frontend-subnet01"
        address_prefixes = ["10.0.1.0/24"]
      }
      s2 = {
        name             = "dev-backend-subnet01"
        address_prefixes = ["10.0.2.0/24"]
      }
    }

  }
}


public_ips = {
  pip1 = {
    pip_name            = "pip-frontend-ip1"
    resource_group_name = "dev-rg1"
    location            = "eastus"
    allocation_method   = "Static"
    sku                 = "Standard"
    domain_name_label   = "devpublicip01"
    idle_timeout        = 10
    zones               = ["1", "2", "3"]
    environment         = "Development"

  }

  pip2 = {
    pip_name            = "pip-backend-ip1"
    resource_group_name = "dev-rg1"
    location            = "eastus"
    allocation_method   = "Static"
    sku                 = "Standard"
    domain_name_label   = "devpublicip01"
    idle_timeout        = 10
    zones               = ["1", "2", "3"]
    environment         = "Development"

  }
}

vms = {
  vm1 = {

    nic_name    = "dev-nic1"
    location    = "east us"
    rg_name     = "dev-rg1"
    vnet_name   = "dev-vnet"
    pip_name    = "pip-dev-ip1"
    subnet_name = "dev-frontend-subnet01"
    ip_configurations = {
      config1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }

    }
    vm_name  = "dev-frontend-vm1"
    vm_size  = "Standard_DS1_v2"
    key_name = "dev-KV01"
    # admin_username = "devopsaaaadmin"
    # admin_password = "Agh@htdkwd387"

    os_disk = {

      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }

  vm2 = {

    nic_name    = "prod-nic1"
    location    = "east us"
    rg_name     = "dev-rg1"
    key_name    = "dev-KV01"
    vnet_name   = "dev-vnet"
    pip_name    = "pip-prod-ip1"
    subnet_name = "dev-backend-subnet01"
    ip_configurations = {
      config1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }

    }
    vm_name = "dev-backend-vm1"
    vm_size = "Standard_DS1_v2"
    # admin_username = "devopsaaaadmin"
    # admin_password = "Agh@htdkwd387"

    os_disk = {

      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}


nsgs = {
  nsg1 = {
    nsg_name = "dev-nsg001"
    location = "eastus"
    rg_name  = "dev-rg1"
    security_rules = {
      rule1 = {
        name                       = "dev-security01"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }


    }
  }
}


sql_database = {
  db1 = {
    db_name      = "dev-sql-db"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size     = 2
    sku_name     = "S0"
    server_name  = "devmssql01"
    rg_name      = "dev-rg101"
    enclave_type = "VBS"
    tags = {
      foo = "bar"
    }
  }

}

servers = {
  server1 = {
    server_name = "devmssql01"
    rg_name     = "dev-rg101"
    key_name    = "dev-server-KV01"
    location    = "centralus"
    version     = "12.0"
    # administrator_login          = "adminuser"
    # administrator_login_password = "v@ip@3476"
    tls_version = "1.2"
  }

}

dev-kv = {
  kv1 = {
    key_name = "dev-KV01"
    location = "eastus"
    rg_name  = "dev-rg1"
    access_policys = {
      access_policy1 = {
        key_permissions     = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge"]
        secret_permissions  = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore"]
        storage_permissions = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore"]
      }
    }
  }

  kv2 = {
    key_name = "dev-server-KV01"
    location = "eastus"
    rg_name  = "dev-rg1"
    access_policys = {
      access_policy1 = {
        key_permissions     = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge"]
        secret_permissions  = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore"]
        storage_permissions = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore"]
      }
    }
  }


}


