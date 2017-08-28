# example-robot
Example Robot Framework

Prerequities?
--------------------------------------------
- Homebrew
- Python
- RobotFramework
- robotframework-seleniumlibrary
- Virtualenv
- Chrome
- Chromedriver


How to Run Test (Local)
--------------------------------------------
- Make sure latest Chrome already installed
- Open terminal
- Install virtualenv `pip install virtualenv -U`
- Install Chromedriver `brew install chromedriver`
- Go to the root project folder
- Set BROWSER_ENV = local on the config/env.py file
- Type `virtualenv venv`
- Type `source venv/bin/activate`
- Type `pip install -r requirements.txt -U`
- Type `robot tests/add_product_to_cart_tests.robot`
