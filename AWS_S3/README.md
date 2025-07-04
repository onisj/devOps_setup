
# AWS S3 Mini Project

This project provides hands-on experience with **Amazon S3**, covering core concepts like **buckets, objects, versioning, permissions, and lifecycle policies**.

---

## 🧭 Part 1: Create a New S3 Bucket

1. Search for `S3` in the AWS Console.

   ![Search S3](img/s3.png)

2. Click **Create bucket**.

   ![Create Bucket](img/create-bucket-button.png)

3. Set a unique **Bucket name** (`my-first-s3-bucket-drix`).

   ![Bucket Name](img/set-bucket-name.png)

4. Set **Object Ownership** to `ACLs disabled`.

5. Leave **Block all public access** checked.

6. Leave **Versioning disabled** for now.

7. Click **Create bucket**.

   ![Confirm Bucket Creation](img/finalize-create-bucket.png)

---

## 📁 Part 2: Upload an Object to the Bucket

1. Click the bucket name (`my-first-s3-bucket-drix`) to open it.

   ![Open Bucket](img/open-bucket.png)

2. Click **Upload** → **Add files** → select a local file.

   ![Upload File](img/upload-object.png)

3. Click **Upload** to finish.

   ![Upload Confirmation](img/upload-confirmation.png)

---

## 🔄 Part 3: Enable Versioning

1. Open the **Properties** tab in the bucket.

   ![Bucket Properties Tab](img/bucket-properties.png)

2. Scroll to **Bucket Versioning** → Click **Edit**.

   ![Edit Versioning](img/edit-versioning.png)

3. Enable it, then click **Save changes**.

   ![Enable Versioning](img/enable-versioning.png)

4. Re-upload the same file to create a new version.

5. Click **Show versions** to view history.

   ![Show Versions](img/show-versions.png)

---

## 🔐 Part 4: Set Bucket Policy for Public Access

1. Go to the **Permissions** tab → **Block public access** section.
   ![Block Public Access](img/block-public-access.png)
2. Click **Edit** and uncheck **Block all public access**.
3. Click **Save changes**.
   ![Save Changes](img/save-changes.png)

4. Go to **Permissions** → **Bucket policy** tab.

   ![Open Bucket Policy](img/open-bucket-policy.png)

5. Use the **Policy Generator** or paste this policy manually:

```json
{
  "Id": "Policy1714394236530",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1714394172266",
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["s3:GetObject", "s3:GetObjectVersion"],
      "Resource": "arn:aws:s3:::my-first-s3-bucket-drix/*"
    }
  ]
}
```

   ![Paste Policy](img/Paste-plicy.png)

3. Click **Save changes**, then type `"confirm"` to apply.

   ![Confirm Policy](img/confirm-public-access.png)

4. Now click on an object URL to test public access.

   ![Object URL](img/click-object-url.png)

---

## ♻️ Part 5: Create a Lifecycle Rule

1. Go to **Management** → Click **Create lifecycle rule**.

   ![Add Lifecycle Rule](img/add-lifecycle-rule.png)

2. Name the rule (e.g., 'my-lifecycle-rule').

3. Choose limit the scope of this rule using one or more filters.

4. Select **Transition current versions of objects** to **Standard-IA** after 30 days.

   ![Set Transition](img/set-transition.png)

5. Click **Create rule** to save.

   ![Lifecycle Rule Created](img/lifecycle-rule-created.png)

---

## ✅ Project Reflection

Participants:

- I gained hands-on experience with Amazon S3, a core service of AWS.
- I managed S3 buckets and objects, learning key concepts like versioning, permissions management, and lifecycle policies.
- I developed a solid understanding of S3 features.
- I learnt to optimize storage costs and ensure data reliability and accessibility using AWS features.
- With this project, I was equipped with valuable skills applicable to real-world scenarios.
