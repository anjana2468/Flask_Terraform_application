from flask import Flask, render_template, request, redirect, url_for, flash

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Required for flash messages

# Route for Home Page
@app.route('/')
def home():
    return render_template('home.html')

# Route for About Page
@app.route('/about')
def about():
    return render_template('about.html')

# Route for Contact Page
@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        message = request.form['message']
        
        
        flash(f'Thank you, {name}! Your message has been sent.')
        
        return redirect(url_for('thank_you'))  

    return render_template('contact.html')
@app.route('/thank_you')
def thank_you():
    return "<h1>Thank You for your message. We will contact you as soon as possible!!!</h1>"

# Route for Redirection
@app.route('/redirect')
def go_home():
    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(host="0.0.0.0",port=5000)
