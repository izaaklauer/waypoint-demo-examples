project = "example-nodejs-eks"

app "example-nodejs-eks" {
  runner {
    profile = "aws-eks"
  }

  build {
    use "pack" {}
    registry {
      use "docker" {
        image = "ttl.sh/izaaktest"
        tag        = "1h"
      }
    }
  }

  deploy {
    use "kubernetes" {
      probe_path = "/"
    }
  }

  release {
    use "kubernetes" {
      load_balancer = true
      port          = 80
    }
  }
}
