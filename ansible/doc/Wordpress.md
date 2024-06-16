# WordPress - Ansible

## Step 1: Create Variable File

- **Location:** Place your variable file in the `/vars` directory.
- **Naming:** Name the file after your hostname, for example `innovaox.yml`.

## Step 2: Populate the Variable File

- Add the following configurations to your variable file. Adjust the values as necessary for your environment:

```yaml
username: "wpuser"
groupname: "wpgroup"
domainName: "example.com"
domainAlias: "www.example.com"
env: "production"
db_user: "wp_db_user"
db_name: "wordpress_db"
db_host: "localhost"
php_version: 8.2
post_max_size: "256M"
upload_max_filesize: "25M"
max_execution_time: 90
max_input_time: 90
memory_limit: "128M"
deploymentgroupname: "wp_deployment_group"
agentname: "MFP-001"
projectname: "WordPressSite"
project_name: "WordPressSite"
git_repo: "https://dev.azure.com/yourorganization/yourproject/_git/yourrepository"
git_branch: "main"
```

### Explanation of Each Field

- **username**: The username for managing WordPress (not necessarily the admin login).
- **groupname**: The group associated with the user managing WordPress.
- **domainName**: The primary domain where WordPress is hosted.
- **domainAlias**: Alternative domain names (like www versions).
- **env**: Deployment environment (e.g., production, staging, development).
- **db_user**: Username for the database.
- **db_name**: Name of the database.
- **db_host**: Hostname or IP address of the database server.
- **php_version**: PHP version used for WordPress.
- **post_max_size**: Maximum size of post data allowed.
- **upload_max_filesize**: Maximum size for uploaded files.
- **max_execution_time**: Maximum time in seconds a script is allowed to run before it is terminated.
- **max_input_time**: Maximum time in seconds a script is allowed to parse input data.
- **memory_limit**: Maximum amount of memory a script may consume.
- **deploymentgroupname**: The name of the deployment group for managing rollouts.
- **agentname**: An identifier for the deployment agent.
- **projectname/project_name**: The name of the project (ensure consistency in naming conventions).
- **git_repo**: URL to the Git repository containing your WordPress code.
- **git_branch**: The main branch from which deployment is carried out.

Make sure to adjust these example values to match the specifics of your setup and maintain consistency in the naming and configuration to avoid errors during deployment.

## Step 3: Create a Vault File

- **Location:** Place this inside the `/vault` directory.
- **Naming:** Use the hostname for the filename, e.g., `innovaox.yml`.

## Step 4: Populate the Vault File

- Include sensitive data such as API tokens and database passwords. Update as necessary:

```yaml
token: "your_token_here"
db_password: "your_db_password_here"
```

## Step 5: Encrypt the Vault

- Encrypt your vault file to secure the sensitive data using the following command:

```bash
ansible-vault encrypt {hostname}.yml
```

- Replace `{hostname}` with the actual hostname of your vault file.

## Step 6: Deploy Using Ansible

- Push your changes to your version control system.
- From your Infrastructure as Code (IaC) server, run the Ansible playbook with the following command:

```bash
ansible-playbook deploy_wordpress.yml --ask-vault-pass --extra-vars="hostname={hostname} -i inventory --limit {ip_address}"
```

- Replace `{hostname}` with the actual hostname you are working with.
- Replace `{ip_address}` with the server you want execute the playbook on.

## Step 7: Verification

- Verify the deployment by accessing your WordPress site through its domain name to ensure all configurations are applied correctly.

### Additional Tips

- **Version Control**: Always ensure you're not pushing the unencrypted vault files to your Git repository.
- **Variable Management**: Consider using dynamic variables for environments where hostname or other parameters might change frequently.
- **Security Practices**: Regularly rotate sensitive credentials and update the vault file accordingly.
