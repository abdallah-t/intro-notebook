# Use the base image
FROM docker.io/manimcommunity/manim:v0.17.3

# Create a temporary directory for fonts
RUN mkdir -p /tmp/fonts

# Copy the fonts from your local directory to the temporary directory
COPY ./assets/fonts/SpaceMono-Regular.ttf /tmp/fonts/
COPY ./assets/fonts/Vazirmatn-Black.ttf /tmp/fonts/
COPY ./assets/fonts/Vazirmatn-Regular.ttf /tmp/fonts/

# Install the fonts by copying them to the system font directory
RUN cp /tmp/fonts/* /usr/share/fonts/ && \
    fc-cache -fv

# Clean up the temporary directory
RUN rm -rf /tmp/fonts

# Copy your manim project files to the container
COPY --chown=manimuser:manimuser . /manim