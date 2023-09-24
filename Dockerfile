# Use the base image from Docker Hub
FROM docker.io/manimcommunity/manim:v0.17.3

# Install sudo (if not already installed)
RUN apt-get update && apt-get install -y sudo

# Create a directory for fonts inside the container using sudo
RUN sudo mkdir -p /usr/share/fonts/truetype/myfonts

# Copy your fonts from the host machine (in the "fonts" directory) to the container
COPY --chown=manimuser:manimuser ./assets/fonts/Vazirmatn-Regular.ttf /usr/share/fonts/truetype/myfonts/
COPY --chown=manimuser:manimuser ./assets/fonts/Vazirmatn-Black.ttf /usr/share/fonts/truetype/myfonts/
COPY --chown=manimuser:manimuser ./assets/fonts/SpaceMono-Regular.ttf /usr/share/fonts/truetype/myfonts/

# Update the font cache in the container
RUN fc-cache -f -v

# Set any other instructions you need for your image
# For example, you can specify the entry point or other configurations here

# Your existing copy instruction
COPY --chown=manimuser:manimuser . /manim