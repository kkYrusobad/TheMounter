![TheMounter](https://socialify.git.ci/kkYrusobad/TheMounter/image?description=1&descriptionEditable=A%20script%20that%20connects%20to%20a%20self-hosted%20wireguard%20VPN%20instance%20whilst%20keeping%20check%20of%20mounted%20volumes.&font=Source%20Code%20Pro&language=1&name=1&owner=1&pattern=Brick%20Wall&theme=Dark)

## Authors

- [@kkYrusobad](https://www.github.com/kkYrusobad)


## Mounts... Why?

Suppose we have a network drive mounted with ip-1 (not connected to the VPN). Now if we connect to VPN without unmounting the drive first, mount point won't work as intended because of the public IP change (say ip-2). Changing public IPs like this makes applications running processes dependent on volume and directory end point unusable (fusermount can be used to umount volume in this case).  

### Solution?

Everytime this script is executed (either one), It checks for any mounted volumes (if exists).
- if yes, then it unmounts the drive ▶️ connects to the VPN ▶️ mounts it back.
- if not, then connects to VPN.

This happens when disconnecting from the VPN as well.

---

## Run Locally

Clone the project

```bash
git clone https://github.com/kkYrusobad/TheMounter.git
```

Go to the project directory

```bash
cd TheMounter
```

Edit the `.sh` to suit your setup at home. 


## Roadmap

- [x] ~COLORS!~
- [ ] Merge seperate scripts to one
- [ ] reduce keystrokes
- [ ] increase efficiency, (pertaining to the dummy processes used)


## 🔗 Links
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://nottunnellove.tk/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/kkyrusobad/)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/kkYrusobad)


## License

[MIT](https://choosealicense.com/licenses/mit/)

