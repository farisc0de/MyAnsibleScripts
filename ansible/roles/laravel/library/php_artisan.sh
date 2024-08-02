#!/bin/bash

source $1

function cache_clear() {
    cd $working_dir
    php $artisan_path cache:clear
}

function config_cache() {
    cd $working_dir
    php $artisan_path config:cache
}

function config_clear() {
    cd $working_dir
    php $artisan_path config:clear
}

function key_generate() {
    cd $working_dir
    php $artisan_path key:generate
}

function migrate() {
    cd $working_dir
    php $artisan_path migrate --force
}

function seed() {
    cd $working_dir
    php $artisan_path db:seed --force
}

function optimize() {
    cd $working_dir
    php $artisan_path optimize
}

function route_cache() {
    cd $working_dir
    php $artisan_path route:cache
}

function route_clear() {
    cd $working_dir
    php $artisan_path route:clear
}

function view_cache() {
    cd $working_dir
    php $artisan_path view:cache
}

function view_clear() {
    cd $working_dir
    php $artisan_path view:clear
}

function storage_link() {
    cd $working_dir
    php $artisan_path storage:link
}

function print_error() {
    printf '{"failed": %s, "msg": "%s"}' "$1" "$2"
    exit 1
}

function print_status() {
    printf '{"changed": %s, "msg": "%s"}' "$1" "$2"
}

case $command in
    cache:clear)
        cache_clear
        print_status "true" "Cache cleared"
    ;;
    config:cache)
        config_cache
        print_status "true" "Configuration cached"
    ;;
    config:clear)
        config_clear
        print_status "true" "Configuration cleared"
    ;;
    key:generate)
        key_generate
        print_status "true" "Key generated"
    ;;
    db:migrate)
        migrate
        print_status "true" "Migrated"
    ;;
    seed)
        seed
        print_status "true" "Seeded"
    ;;
    optimize)
        optimize
        print_status "true" "Optimized"
    ;;
    route:cache)
        route_cache
        print_status "true" "Route cached"
    ;;
    route:clear)
        route_clear
        print_status "true" "Route cleared"
    ;;
    view:cache)
        view_cache
        print_status "true" "View cached"
    ;;
    view:clear)
        view_clear
        print_status "true" "View cleared"
    ;;
    storage:link)
        storage_link
        print_status "true" "Storage linked"
    ;;
    *)
        failed=true
        msg="Invalid command"
        print_error "$failed" "$msg"
    ;;
esac

exit 0