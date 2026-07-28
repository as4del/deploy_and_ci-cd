cmake_minimum_required(VERSION 3.14)
project(hw_cpp CXX)

set(CMAKE_CXX_STANDARD 20)

find_package(userver REQUIRED COMPONENTS core postgresql)
userver_setup_environment()
# Собираем исполняемый файл
add_executable(${PROJECT_NAME} main.cpp jacob.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE userver::core userver::postgresql)

# Подключаем тесты через simple-версию без аргументов

userver_testsuite_add_simple()