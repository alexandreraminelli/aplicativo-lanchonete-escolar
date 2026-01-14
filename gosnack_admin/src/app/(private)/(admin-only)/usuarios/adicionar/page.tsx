import AuthForm from "@/components/forms/AuthForm"
import { IMAGES } from "@/constants/images"
import { NAV_TEXTS } from "@/constants/texts/navigation.texts"
import Image from "next/image"

/** Página de adicionar novo usuário. */
export default function AddUserPage() {
  return (
    <div className="flex flex-row gap-10 justify-around">
      {/* Form de cadastro */}
      <main className="space-y-6 w-full max-w-xl">
        <h2 className="font-semibold text-3xl md:text-4xl text-center md:text-start">{NAV_TEXTS.addUser}</h2>
        <AuthForm mode="sign-up" />
      </main>

      {/* Ilustração */}
      <aside className=" max-md:hidden max-w-2/5 self-start mt-10 sticky top-20 transition-all">
        <Image src={IMAGES.illustrations.addUser} alt="" width={752} height={556} className="object-cover" />
      </aside>
    </div>
  )
}
