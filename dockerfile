FROM amazonlinux:2
# ↑Amazon linux 2022が正式リリースしたら更新

WORKDIR /app

SHELL ["/bin/bash", "-c"]
RUN yum update -y
RUN yum install -y gcc bzip2 bzip2-devel openssl openssl-devel readline readline-devel git libffi-devel wget gcc-c++ unixODBC-devel tar.x86_64 yum-utils python-devel mysql-devel python3-devel

RUN echo 'export PYENV_ROOT="/usr/local/pyenv"' | tee -a /etc/profile.d/pyenv.sh
RUN echo 'export PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}"' | tee -a /etc/profile.d/pyenv.sh
RUN echo 'eval "$(pyenv init -)"' | tee -a /etc/profile.d/pyenv.sh

RUN git clone https://github.com/pyenv/pyenv.git /usr/local/pyenv

ENV PYENV_ROOT "/usr/local/pyenv"
ENV PATH "${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}"
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN pyenv install -v 3.7.6 && pyenv global 3.7.6 && pip install awscli 

# # ソースコードをコピー
# COPY src/ /app/src
# COPY tests/ /app/tests
# COPY requirements.txt /app
# COPY setup.py /app
# 結果を格納するフォルダを作成
RUN mkdir results

RUN pip install -r requirements.txt
# テストコードで使用するために、ライブラリとして登録
RUN pip install .

EXPOSE 80

#CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "80"]