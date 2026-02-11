variable "tools" {
  default = {
    # vault={
    #   instance_type="t3.micro"
    #   port= 8200
    # }
    github-runner={
      instance_type= "t3.micro"
      port= 443
      iam_policy= {
        Action =   ["*"]
        Resource = []
      }
    }
    # jenkins= {
    #   instance_type = "t3.micro"
    #   port          = 8080
    #   iam_policy= {
    #     Action  = []
    #     Resource= []
    #   }
    # }

    # jenkins_agent={
    #   instance_type="t3.micro"
    #   port=8080
    #   iam_policy={
    #     Action=[]
    #     Resource=[]
    #   }
    # }
  }
}


