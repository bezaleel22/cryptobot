FROM alpine/git as src

WORKDIR /src

RUN git clone https://github.com/bezaleel22/MemeFiBot.git
RUN git clone https://github.com/bezaleel22/TapSwapBot.git
RUN git clone https://github.com/bezaleel22/HamsterKombatBot.git
RUN git clone https://github.com/bezaleel22/PocketFiBot.git
RUN git clone https://github.com/bezaleel22/YesCoinBot.git


FROM python:3.10.11-alpine3.18 as MemeFiBot
WORKDIR /app
COPY --from=src /src/MemeFiBot/requirements.txt requirements.txt
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-warn-script-location --no-cache-dir -r requirements.txt
COPY --from=src /src/MemeFiBot/ /app
CMD ["python3", "main.py", "-a", "2"]

FROM python:3.10.11-alpine3.18 as TapSwapBot
WORKDIR /app
COPY --from=src /src/TapSwapBot/requirements.txt requirements.txt
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-warn-script-location --no-cache-dir -r requirements.txt
COPY --from=src /src/TapSwapBot/ /app
CMD ["python3", "main.py", "-a", "2"]

FROM python:3.10.11-alpine3.18 as HamsterKombatBot
WORKDIR /app
COPY --from=src /src/HamsterKombatBot/requirements.txt requirements.txt
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-warn-script-location --no-cache-dir -r requirements.txt
COPY --from=src /src/HamsterKombatBot/ /app
CMD ["python3", "main.py", "-a", "2"]

FROM python:3.10.11-alpine3.18 as PocketFiBot
WORKDIR /app
COPY --from=src /src/PocketFiBot/requirements.txt requirements.txt
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-warn-script-location --no-cache-dir -r requirements.txt
COPY --from=src /src/PocketFiBot/ /app
CMD ["python3", "main.py", "-a", "2"]

FROM python:3.10.11-alpine3.18 as YesCoinBot
WORKDIR /app
COPY --from=src /src/YesCoinBot/requirements.txt requirements.txt
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-warn-script-location --no-cache-dir -r requirements.txt
COPY --from=src /src/YesCoinBot/ /app
CMD ["python3", "main.py", "-a", "2"]