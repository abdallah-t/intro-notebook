# Use the base image from Docker Hub
FROM docker.io/manimcommunity/manim:v0.17.3

# Create a non-root user
RUN useradd -ms /bin/bash manimuser

# Switch to the non-root user
USER manimuser

# Create a directory for fonts inside the user's home directory
RUN mkdir -p /home/manimuser/.fonts/truetype/myfonts

# Copy your fonts from the host machine (in the "fonts" directory) to the container
COPY --chown=manimuser:manimuser ./assets/fonts/Vazirmatn-Regular.ttf /usr/share/fonts/truetype/myfonts/
COPY --chown=manimuser:manimuser ./assets/fonts/Vazirmatn-Black.ttf /usr/share/fonts/truetype/myfonts/
COPY --chown=manimuser:manimuser ./assets/fonts/SpaceMono-Regular.ttf /usr/share/fonts/truetype/myfonts/
# Update the font cache in the user's home directory
RUN fc-cache -f -v /home/manimuser/.fonts

# Set any other instructions you need for your image
# For example, you can specify the entry point or other configurations here

# Your existing copy instruction
COPY --chown=manimuser:manimuser . /manim