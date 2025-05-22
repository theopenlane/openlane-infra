package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Usage: openlane [render|seal|bootstrap]")
		os.Exit(1)
	}

	switch os.Args[1] {
	case "render":
		env := "dev"
		if len(os.Args) > 2 {
			env = os.Args[2]
		}
		fmt.Println("Rendering Helm templates for environment:", env)
		cmd := exec.Command("helm", "template", "openlane", "./charts/openlane", "-f", "values.yaml", "-f", "values-"+env+".yaml", "--output-dir", "./rendered/"+env)
		cmd.Stdout = os.Stdout
		cmd.Stderr = os.Stderr
		err := cmd.Run()
		if err != nil {
			fmt.Println("Error rendering Helm:", err)
			os.Exit(1)
		}

	case "seal":
		if len(os.Args) < 4 {
			fmt.Println("Usage: openlane seal input.yaml output.yaml")
			os.Exit(1)
		}
		input := os.Args[2]
		output := os.Args[3]
		cmd := exec.Command("kubeseal", "--format", "yaml", "--cert", "sealed-secrets.crt", "-o", output)
		in, _ := os.Open(input)
		cmd.Stdin = in
		cmd.Stdout = os.Stdout
		cmd.Stderr = os.Stderr
		err := cmd.Run()
		if err != nil {
			fmt.Println("Error sealing secret:", err)
			os.Exit(1)
		}

	case "bootstrap":
		fmt.Println("Bootstrapping Config Sync...")
		cmd := exec.Command("./scripts/bootstrap-config-controller.sh")
		cmd.Stdout = os.Stdout
		cmd.Stderr = os.Stderr
		err := cmd.Run()
		if err != nil {
			fmt.Println("Bootstrap failed:", err)
			os.Exit(1)
		}

	default:
		fmt.Println("Unknown command:", os.Args[1])
		os.Exit(1)
	}
}
