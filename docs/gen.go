package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
)

//go:generate go run gen.go

func main() {
	load("en", "api-documentation", "authentication", "endpoints", "ws-requests", "websockets-based-api", "rest-api", "message-format")
	load("cn", "api-documentation", "authentication", "endpoints", "ws-requests", "websockets-based-api", "rest-api", "message-format")
}

func load(lang string, files ...string) {
	strs := map[string]string{}
	for _, file := range files {
		filename := fmt.Sprintf("%s/%s.md", lang, file)
		cnt, err := ioutil.ReadFile(filename)
		errorCheck(fmt.Sprintf("loading file %s", filename), err)

		strs[file] = string(cnt)
	}

	cnt, _ := json.Marshal(strs)
	outFile := fmt.Sprintf("%s.json", lang)
	err := ioutil.WriteFile(outFile, cnt, 0644)
	errorCheck("writing "+outFile, err)

	// Copy to /keybase/public/abourget/dfuse-docs/en.json
}

func errorCheck(prefix string, err error) {
	if err != nil {
		fmt.Printf("ERROR: %s: %s\n", prefix, err)
		os.Exit(1)
	}
}
