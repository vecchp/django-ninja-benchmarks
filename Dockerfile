FROM pypy:3.10

# Set bash as the default shell
ENV PYTHONUNBUFFERED=1 PIP_DISABLE_PIP_VERSION_CHECK=on PATH="/root/.cargo/bin:${PATH}"

# Need Rust toolchain
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY common_django_settings.py /common_django_settings.py
COPY app_drf /app_drf
COPY app_flask_marshmallow /app_flask_marshmallow
COPY app_ninja /app_ninja
COPY app_fastapi /app_fastapi
COPY network_service.py /network_service.py
