package main

import (
	"context"
	"log"
	"os"

	tfe "github.com/hashicorp/go-tfe"
)

func main() {

	name := os.Getenv("TF_WORKSPACE")
	log.Printf("Creating workspace %s", name)
	organization := os.Getenv("TF_ORG")
	log.Printf("Organization: %s", organization)
	token := os.Getenv("TFE_TOKEN")
	operations := false

	config := &tfe.Config{
		Token: token,
	}

	client, err := tfe.NewClient(config)
	if err != nil {
		log.Fatal(err)
	}

	// Create a context
	ctx := context.Background()

	// Create a new workspace
	_, err = client.Workspaces.Create(ctx, organization, tfe.WorkspaceCreateOptions{
		Name:       tfe.String(name),
		Operations: &operations,
	})

	if err != nil {
		// If workspace already exists we make sure that is only used to store and synchronize state
		taken := "invalid attribute\n\nName has already been taken"
		if err.Error() == taken {
			_, err = client.Workspaces.Update(ctx, organization, name, tfe.WorkspaceUpdateOptions{
				Operations: &operations,
			})

			if err != nil {
				log.Fatal(err)
			} else {
				os.Exit(0)
			}
		}

		log.Fatal(err)
	}
}
