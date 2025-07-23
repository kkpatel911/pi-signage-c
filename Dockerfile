FROM debian:bookworm

# Install Qt6, pkg-config and dependencies
RUN apt-get update && \
    apt-get install -y qt6-base-dev qt6-webengine-dev libgl1-mesa-glx g++ pkg-config \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy source files
COPY main.cpp .
COPY index.html .
COPY sample.mp4 .

# Build the application
RUN g++ main.cpp -o minimal_signage_app `pkg-config --cflags --libs Qt6WebEngineWidgets Qt6Widgets Qt6Core Qt6Gui`

# Run at startup
ENV QTWEBENGINE_CHROMIUM_FLAGS="--no-sandbox"
CMD ["./minimal_signage_app"]