# Dokuen Solo

**BIG FAT WARNING** This is not ready for prime time. I'm not even using it yet. In fact, right now this is just a README and a version number.

Deploy 12-factor applications to remote servers using heroku-style buildpacks. Dokuen Solo leverages Capistrano to talk to remote servers.

## Usage

1. Create a Capfile in your project that looks like this:

    ```
    require 'rubygems'
    require 'dokuen-solo/recipes/deploy'
    load 'deploy'

    # git url to the buildpack to use for this app
    set :buildpack_url, "https://github.com/heroku/heroku-buildpack-ruby.git"

    # The list of domain names to associate with this app
    set :domain_names, ["www.yourappname.com"]

    set :config_vars, {
      'LANG' => 'en_us.UTF-8',
      'GEM_PATH' => 'vendor/bundle/ruby/1.9.1:.',
      'RACK_ENV' => 'production',
      'PATH' => 'bin:vendor/bundle/ruby/1.9.1/bin:/usr/local/bin:/usr/bin:/bin',
    }
    ```

2. Add a remote server. Note: right now Dokuen Solo only supports Ubuntu 12.04 LTS and Nginx.

    ```
    $ dokuen-solo add yourserver you@yourserver.com
    ```

3. Prepare your remote server. This will create the required directory structure as well as install a few gems that are needed for installation.

    ```
    $ cap teroknor deploy:prepare
    ```
    
4. Push your app

    ```
    $ cap teroknor deploy
    ```
    
5. Check to see your app deployed correctly

    ```
    $ curl http://www.yourdomain.com
    ```
