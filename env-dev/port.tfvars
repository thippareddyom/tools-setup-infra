ingress_rules= [
    {
        description =   "SSH"
        from_port   =   22
        to_port     =   22
        protocol    =   "tcp"
        cidr_blocks =   ["0.0.0.0/0"]
    },
    {
        description =   "App pOrt"
        from_port   =   8200
        to_port     =   8200
        protocol    =   "tcp"
        cidr_blocks =   ["0.0.0.0/0"]
    }
]