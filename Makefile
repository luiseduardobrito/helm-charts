HELM_URL := "https://luiseduardobrito.github.io/helm-charts"

package: # Prepares the chart for distribution
	@helm package ./helm-n8n
	@helm repo index --url $(HELM_URL) .


.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'