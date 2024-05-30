# Laravel - Ansible

**Step 1: Create Variable File**

- **Location:** Place your variable file in the `/vars` directory.
- **Naming:** Name the file after your hostname, for example `davos.ansible.yml`.

**Step 2: Populate the Variable File**

- Add the following configurations to your variable file. Adjust the values as necessary for your environment:

Here's the same YAML configuration template you provided, but filled in with generic placeholder values for each field:

```yaml
username: "example_user"
groupname: "example_group"
domainName: "exampledomain.com"
domainAlias: "www.exampledomain.com"
php_version: 8.2
post_max_size: "256M"
upload_max_filesize: "256M"
max_execution_time: 90
max_input_time: 90
memory_limit: "128M"
deploymentgroupname: "example_deployment_group"
agentname: "AGENT001"
projectname: "Example Project Name"
project_name: "ExampleProject"
git_repo: "git@yourgitrepo.com:exampleuser/exampleproject.git"
git_branch: "main"
```

### Explanation of Each Field:

- **username**: The username for system or application use.
- **groupname**: The group associated with the username.
- **domainName**: Primary domain where the service is hosted.
- **domainAlias**: Any alias for the primary domain, such as the 'www' variant.
- **php_version**: The version of PHP that the server will run.
- **post_max_size**: The maximum size of POST data that PHP will accept.
- **upload_max_filesize**: The maximum file size that can be uploaded through PHP.
- **max_execution_time**: The maximum time in seconds that a script is allowed to run before it is terminated by the parser.
- **max_input_time**: The maximum time in seconds a script is allowed to parse input data, like POST and GET.
- **memory_limit**: The maximum amount of memory in megabytes that a script is allowed to allocate.
- **deploymentgroupname**: The name of the group handling deployments.
- **agentname**: A unique identifier for the deployment agent.
- **projectname**: The formal name of the project.
- **project_name**: Another field for the project name; ensure this is intentionally duplicated or adjust as needed.
- **git_repo**: The SSH or HTTPS path to the git repository.
- **git_branch**: The main branch from which deployment is carried out.

Adjust these placeholder values to fit the specifics of your actual configuration.

**Step 4: Populate the Vault File**

- Include sensitive data such as API tokens and database passwords. Update as necessary:

```yaml
token: "your_token_here"
db_password: "your_db_password_here"
```

**Step 5: Encrypt the Vault**

- Encrypt your vault file to secure the sensitive data using the following command:

```bash
ansible-vault encrypt {hostname}.ansible.yml
```

- Replace `{hostname}` with the actual hostname of your vault file.

**Step 6: Deploy Using Ansible**

- Push your changes to your version control system.
- From your Infrastructure as Code (IaC) server, run the Ansible playbook with the following command:

```bash
ansible-playbook deploy_laravel.ansible.yml --ask-vault-pass --extra-vars="hostname={hostname} -i inventory --limit {ip_address}"
```

- Replace `{hostname}` with the actual hostname you are working with.
- Replace `{ip_address}` with the server you want execute the playbook on.

**Step 7: Verification**

- Verify the deployment by accessing your Laravel site through its domain name to ensure all configurations are applied correctly.

### Additional Tips:

- **Version Control**: Always ensure you're not pushing the unencrypted vault files to your Git repository.
- **Variable Management**: Consider using dynamic variables for environments where hostname or other parameters might change frequently.
- **Security Practices**: Regularly rotate sensitive credentials and update the vault file accordingly.
