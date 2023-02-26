HELM_URL := "https://luiseduardobrito.github.io/helm-charts"

package: # Prepares the chart for distribution
	@helm package ./actualbudget
	@helm package ./homepage
	@helm package ./kubegres-admin
	@helm package ./longhorn
	@helm package ./music-graph
	@helm package ./n8n
	@helm package ./tailscale-relay
	@helm package ./vaultwarden
	@helm repo index --url $(HELM_URL) .


.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'