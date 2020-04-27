echo "Welcome to **Butterfly Budgeting**"

echo "Lets begin the install now"

git clone "https://github.com/r-drkn/budget-terminal-app.git"

cd ./ca-terminal-app/src/

echo "Time to ensure all required gems are installed"

bundle install

echo "All gems have been installed, running application for the first time now"

ruby main.rb