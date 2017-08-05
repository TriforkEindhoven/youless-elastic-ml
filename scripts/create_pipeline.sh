#!/bin/bash

curl -XPUT http://localhost:9200/_ingest/pipeline/youless -d '{
	"description" : "Youless httpbeat events cleanup",
	"processors" : [
		{
			"rename": {
    			"field": "response.jsonBody.pwr",
    			"target_field": "power"
  			}
		},
		{
			"rename": {
    			"field": "response.jsonBody.cnt",
    			"target_field": "total"
  			}
		},
		{
			"rename": {
    			"field": "response.jsonBody.lvl",
    			"target_field": "level"
  			}
		},
		{
			"gsub": {
			    "field": "total",
			    "pattern": ",",
			    "replacement": "."
			  }
		},
		{
		  	"remove": {
		    	"field": "request"
		  	}
		},
		{
		  	"remove": {
		    	"field": "response"
		  	}
		}
	]
}'