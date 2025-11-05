FROM nginx:latest

# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir -p /var/run/sshd

# Set up SSH access
RUN echo 'root:your_password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Copy Nginx configuration files
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports for Nginx and SSH
EXPOSE 80 22

# Start Nginx and SSH server
CMD service ssh start && nginx -g 'daemon off;'
