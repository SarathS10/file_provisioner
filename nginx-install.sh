sudo yum update
sudo yum install nginx -y
sudo systemctl enable nginx
sudo service nginx start
echo "<h1>nginx installing while creating the ec2 itself</h1>" | sudo tee /var/www/html/index.html