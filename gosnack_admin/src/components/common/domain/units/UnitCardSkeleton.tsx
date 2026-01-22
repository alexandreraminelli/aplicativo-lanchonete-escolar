import { Card, CardContent, CardFooter, CardHeader } from "@/components/ui/card"
import { Skeleton } from "@/components/ui/skeleton"

/** Skeleton do `UnitCard`. */
export default function UnitCardSkeleton() {
  return (
    <Card className="justify-between">
      {/* Header */}
      <CardHeader>
        {/* Nome da unidade */}
        <Skeleton className="h-5 w-2/3" />
      </CardHeader>

      {/* Content */}
      <CardContent>
        <div className="space-y-2">
          {/* Linha 1 */}
          <div className="flex items-center gap-2">
            <Skeleton className="size-5 rounded-full" />
            <Skeleton className="h-4 w-1/2" />
          </div>

          {/* Linha 2 */}
          <div className="flex items-center gap-2">
            <Skeleton className="size-5 rounded-full" />
            <Skeleton className="h-4 w-1/3" />
          </div>
        </div>
      </CardContent>

      {/* Footer */}
      <CardFooter className="flex gap-2.5">
        <Skeleton className="h-9 flex-1 rounded-md" />
        <Skeleton className="h-9 flex-1 rounded-md" />
      </CardFooter>
    </Card>
  )
}
