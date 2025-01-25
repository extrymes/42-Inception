<img src="https://i.imgur.com/y2bQtnZ.png" width="150" height="150" alt="Logo" />

# 42-Inception
## Overview
The **Inception** project is part of **42 School** and focuses on building a containerized infrastructure using **Docker**.
It involves setting up and orchestrating multiple services, such as a web server (Nginx), a database (MariaDB/MySQL), and a CMS (WordPress), within isolated Docker containers.

## Getting started
This project is cross-platform compatible.
> Make sure you have installed [Docker Engine](https://docs.docker.com/engine/install/) before proceeding.
1. Clone this repository
```bash
git clone https://github.com/extrymes/42-Inception.git
cd 42-Inception
```
2. Create `srcs/.env` file containing the required environment variables (see below)
```bash
touch srcs/.env
```
3. Open `/etc/hosts` file and replace `localhost` by your domain name
```bash
sudo vim /etc/hosts
```
```diff
- 127.0.0.1 localhost
+ 127.0.0.1 sabras.42.fr
```
4. Build and start all services
```bash
make
```
The project will automatically create the required Docker images and containers.
The necessary volumes will be created in `{HOME}/data`.

## Environment variables
This project uses a `.env` file to configure environment-specific variables.
Below is a list of all the variables required for the project.
<table>
	<thead>
		<tr>
			<th>Variable name</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><code>DB_NAME</code></td>
			<td>The name of the database to connect to.</td>
		</tr>
		<tr>
			<td><code>DB_USER</code></td>
			<td>The username used to authenticate with the database.</td>
		</tr>
		<tr>
			<td><code>DB_USER_PASS</code></td>
			<td>The password associated with the database user for authentication.</td>
		</tr>
		<tr>
			<td><code>DB_HOST</code></td>
			<td>The hostname or IP address of the database server.</td>
		</tr>
		<tr>
			<td><code>DB_ROOT_PASS</code></td>
			<td>The database root password.</td>
		</tr>
		<tr>
			<td><code>WP_DOMAIN_NAME</code></td>
			<td>The domain name of the WordPress site.</td>
		</tr>
		<tr>
			<td><code>WP_TITLE</code></td>
			<td>The title of the WordPress site.</td>
		</tr>
		<tr>
			<td><code>WP_ADMIN_USER</code></td>
			<td>The username for the WordPress administrator account.</td>
		</tr>
		<tr>
			<td><code>WP_ADMIN_PASS</code></td>
			<td>The password for the WordPress administrator account.</td>
		</tr>
		<tr>
			<td><code>WP_ADMIN_EMAIL</code></td>
			<td>The email address for the WordPress administrator account.</td>
		</tr>
		<tr>
			<td><code>WP_EDITOR_USER</code></td>
			<td>The username for the WordPress editor account.</td>
		</tr>
		<tr>
			<td><code>WP_EDITOR_PASS</code></td>
			<td>The password for the WordPress editor account.</td>
		</tr>
		<tr>
			<td><code>WP_EDITOR_EMAIL</code></td>
			<td>The email address for the WordPress editor account.</td>
		</tr>
	</tbody>
</table>

## Contributing
We welcome contributions from everyone! Whether you're fixing bugs, adding new features, improving documentation, or simply sharing your ideas, your input is greatly appreciated.

Thanks for visiting and happy coding!
