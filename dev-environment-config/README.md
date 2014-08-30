#Digital Campaigns

- clone repo
- create db, migrate db, seed db

#Inventory

## Clone repo

    git clone https://github.com/webstreak/inventory.git

## Copy and edit config/database_example.yml

    cp config/database_example.yml config/database.yml

## Create, migrate, and seed database

    rake db:create
    rake db:migrate
    rake db:seed

## Run server and navigate to demo2.lvh.me:3000/cms-admin

- user: user
- pass: pass

## Site setup

- label: demo2
- ident: demo2
- hostname: demo2.lvh.me:3000

## Layout config

- name/ident/app layout: layout1
- content: ```{{ cms:page:content:rich_text }}```

## Page config

- label: index
- layout: layout1
- content: ```{{cms:partial:welcome/layout1/index}}```

## You should now have dev site at demo2.lvh.me:3000



