package main

import (
	cmd "github.com/DedFura/crud-example/cmd/run"
	configs "github.com/DedFura/crud-example/config"
	"github.com/DedFura/crud-example/repo"

	_ "github.com/lib/pq"
)

func main() {
	config, err := configs.LoadConfig("../config/config.yaml")
	if err != nil {
		panic(err)
	}

	db, err := repo.InitDB(config)
	if err != nil {
		panic(err)
	}

	cmd.Run(db)
}
