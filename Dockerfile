# Use the official Ruby image
FROM ruby:3.1.2

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock from the current directory into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install && rails db:migrate

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 for the Rails API
EXPOSE 3000

# migrate and start server
CMD ["sh", "-c", "bin/rails db:migrate && bin/rails db:seed && bin/rails server -b 0.0.0.0 "]
