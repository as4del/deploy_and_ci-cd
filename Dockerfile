# --- ЭТАП 1: Сборка и прогон тестов ---
FROM ghcr.io/userver-framework/ubuntu-22.04-userver-pg:latest AS builder


WORKDIR /app

# 2. Копируем исходники и меняем владельца
COPY . .


# 4. Компилируем проект
RUN cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build



# --- ЭТАП 2: Итоговый образ ---
FROM ghcr.io/userver-framework/ubuntu-22.04-userver-pg:latest

WORKDIR /app

# Копируем бинарник и конфиг
COPY --from=builder /app/build/hw_cpp /usr/bin/jl
COPY --from=builder /app/configs/config.yaml /app/config.yaml

RUN chmod +x /usr/bin/jl

EXPOSE 8080

ENTRYPOINT ["/usr/bin/jl"]
CMD ["--config", "/app/config.yaml"]