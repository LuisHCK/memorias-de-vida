name: Execute SSH Command

on:
  push:
    branches:
      - main  # Trigger the action on push to the main branch

jobs:
  ssh-command-job:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Execute command via SSH
        uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.SERVER_IP }}
          username: ${{ secrets.USERNAME }}
          key: ${{ secrets.SSH_PRIVATE_KEY }}
          port: 21
          script: |
            echo "Running commands on the remote server"
            # Your SSH command here
            ls -la