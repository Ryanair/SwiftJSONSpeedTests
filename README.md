# Swift JSON Parsers Speed Test
This project is created with the objective to test the speed of different JSON Parsers written in Swift in comparison on JSONModel which is in ObjectiveC.

# Results
### iPhone 6S - iOS 9.2.1 (results in seconds)
Libraries | Version |  Simple JSON | Simple JSON x 1000 | Complex JSON
----------|---------| -------------|--------------------|--------------
[JSONModel](https://github.com/icanzilb/JSONModel)| 1.2.0 | 0.001 | 0.024 | 0.002
[Gloss](https://github.com/hkellaway/Gloss) | 0.7 | 0.000 | 0.062 | 0.017
[ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)| 1.2 | 0.000 | 0.061 | 0.016
[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)| 2.3.2 | 0.000 | 0.082 | 0.018
[Decodable](https://github.com/Anviking/Decodable)| 0.4.2 | 0.000 | 0.052 | 0.007
[Unbox](https://github.com/JohnSundell/Unbox)| 1.4 | 0.000 | 0.054 | 0.014
[JSONJoy-Swift](https://github.com/daltoniam/JSONJoy-Swift)| 2.0.0 | 0.000 | 0.054 | 0.009

### iPhone 5 - iOS 8.4.1 (results in seconds)
Libraries | Version |  Simple JSON | Simple JSON x 1000 | Complex JSON
----------|---------| -------------|--------------------|--------------
[JSONModel](https://github.com/icanzilb/JSONModel)| 1.2.0 | 0.002 | 0.150 | 0.002
[Gloss](https://github.com/hkellaway/Gloss) | 0.7 | 0.000 | 0.229 | 0.022
[ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)| 1.2 | 0.000 | 0.227 | 0.024
[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)| 2.3.2 | 0.001 | 0.371 | 0.024
[Decodable](https://github.com/Anviking/Decodable)| 0.4.2 | 0.000 | 0.196 | 0.009
[Unbox](https://github.com/JohnSundell/Unbox)| 1.4 | 0.000 | 0.206 | 0.021
[JSONJoy-Swift](https://github.com/daltoniam/JSONJoy-Swift)| 2.0.0 | 0.000 | 0.175 | 0.011

#JSONs used for the test:
### Simple JSON:
	{
		"first": "sergio",
		"last": "richards",
		"registered": 1267899572
	}

### Complex JSON:
	[
		{
		   "name":{
		      "first":"sergio",
		      "last":"richards",
		   },
		   "registerDetails":{
		      "id":1267899572,
		   }
		},
		// 27 more like this
	]